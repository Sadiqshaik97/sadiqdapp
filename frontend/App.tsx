App

import React from 'react'
import Home from './Home'
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import FirstPage from './FirstPage';

export default function App() {
  return (
    <>
      <BrowserRouter>
        <Routes>
          {/* <Home /> */}
          <Route path="/" element={<Home />} />
          <Route path="/first" element={<FirstPage />} />
        </Routes>
      </BrowserRouter>
    </>
  )
}