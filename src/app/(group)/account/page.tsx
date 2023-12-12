"use client"
import Link from "next/link"
import { useEffect, useState } from "react"

export default function Account() {
  const [session, setSession] = useState<null | string>(null)
  useEffect (() =>{setSession(localStorage.getItem('session'))}, [])
  async function Profile_Exit() {
      localStorage.clear()
      document.location.href= "/"
  }
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div >
          <h2 >
            <span>↓</span> {`Приветствуем повелителя ${session}`} <span>↓</span>
          </h2>
        </div>
        <div >  </div>
        <div >
          <a href="https://nextjs.org/docs?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"  target="_blank" rel="noopener noreferrer">
            <h2 >
              Карта мира <span>-&gt;</span>
            </h2>
          </a>
          <Link href="/view/planet"  rel="noopener noreferrer">
            <h2 >
              Планеты <span>-&gt;</span>
            </h2>
          </Link> 
          <a href="https://nextjs.org/docs?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"  target="_blank" rel="noopener noreferrer">
            <h2 >
              Корабли <span>-&gt;</span>
            </h2>
          </a> 
          <a href="https://nextjs.org/docs?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"  target="_blank" rel="noopener noreferrer">
            <h2 >
              Исследования <span>-&gt;</span>
            </h2>
          </a> 
          <a href="https://nextjs.org/docs?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"  target="_blank" rel="noopener noreferrer">
            <h2 >
              Технологии <span>-&gt;</span>
            </h2>
          </a>
          <div  onClick={Profile_Exit}>
            <h2 >
              Выйти из игры <span>-&gt;</span>
            </h2>
          </div>
        </div>
    </main>
  )
}