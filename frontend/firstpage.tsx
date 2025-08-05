// import { useEffect, useState } from "react";
// import { useNavigate } from "react-router-dom";


// export default function FirstPage() {

//     const [name , setname] = useState("");
//     const [number, setnumber] = useState("");
//     useEffect(() => {
//         checkConnection()
//     }, []);

//     async function checkConnection() {
//         const isConnected = await window.aptos.isConnected();
//         console.log("Is connected:", isConnected);
//         if (!isConnected) {
//             alert("you are not connected to the wallet, redirecting to main page");
//             console.log("Not connected, redirecting to home page.");
//             navigate("/");
//         } else {
//             var add = await window.aptos.account();
//             console.log("Account address:", add?.address);
//         }
//     }

//     var navigate = useNavigate();

//     async function Disconnfun() {
//         window.aptos.disconnect();
//         navigate("/");
//     }

//     function submitfun(){                                           
//         event?.preventDefault();
//         console.log("Name:", name);
//         console.log("Number:", number);
//     }


//     return (
//         <div>
//             <form>
//                 <label htmlFor="address">Enter Name:</label>
//                 <input type="text" id="name" name="name" required onChange={e => setname(e.target.value)}/>
//                 <br />
//                 <label htmlFor="address">Enter number:</label>
//                 <input type="text" id="number" name="number" required onChange={e => setnumber(e.target.value)}/>
//                 <br />
//                 <button onClick={submitfun}>Submit</button>
//             </form>
//             <button onClick={Disconnfun}>Disconnect</button>
//         </div> 
//     )
// }
