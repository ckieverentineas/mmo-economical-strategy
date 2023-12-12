"use client"
import { useRouter } from 'next/navigation';
import { useState } from 'react';
export default function Auth() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [answer, setAnswer] = useState('');
    const handleSubmit = async (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        const data = { email, password };
        console.log(data);
        await Register_User()
    };
    const router = useRouter()
    async function Register_User() {
        const res = await fetch('/api/user/auth', {
            body: JSON.stringify({ email, password }),
            headers: { 'Content-Type': 'application/json' },
            method: 'POST'
        })
        console.log(res)
        const result = await res.json()
        setAnswer(result['status'])
        if (Object.keys(result).length > 1) {
            localStorage.removeItem('session')
            localStorage.setItem('session', `${result['token']}`)
            router.push('/account')
        }
        console.log(result)
    }
    return (
        <div className=''>
            <form onSubmit={handleSubmit}>
                <div>
                    <label htmlFor="email">Email:</label><br/>
                    <input className='border-4'
                        id="email"
                        type="email"
                        onChange={e => setEmail(e.target.value)}
                    /><br/>
                </div>
                <div>
                    <label htmlFor="password">Password:</label><br/>
                    <input className='border-4'
                        id="password"
                        type="password"
                        onChange={e => setPassword(e.target.value)}
                    /><br/>
                </div>
                <button type="submit">Логин</button>
            </form>
            <div>{answer}</div>
        </div>
    );
}