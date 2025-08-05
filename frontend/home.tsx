// import { useNavigate } from "react-router-dom";

// export default function Home() {
//     var navigate = useNavigate();
//     async function connectbtn() {
//         // alert("Connect button clicked!");
//         console.log("Connect button clicked!");
//         const isconnected =await window.aptos.isConnected()
//         console.log("Is connected:", isconnected);
//         if (!isconnected) {
//             await window.aptos.connect();
//             navigate("/first");
//         } else {
//             console.log("Already connected");
//             var add = await window.aptos.account();
//             console.log("Account address:", add?.address);
//         }

//     }

//     return(
//         <>
//             <h1>Welcome to the Home Page</h1>
//             <p>This is the home page of your application.</p>

//             <button onClick={connectbtn}>connect</button>
//         </>
//     );
// }