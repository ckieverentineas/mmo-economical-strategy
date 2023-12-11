import { NextRequest, NextResponse } from "next/server";
import prisma from "../module/prisma";
import { NextApiRequest, NextApiResponse } from "next";
import { Account, User } from "@prisma/client";


export async function POST(request: NextRequest, res: NextResponse<Response>) {
  const req = await request.json()
  console.log(req)
  const { email, password } = req
  const answer = { status: '', token: 0 }
  console.log(`Входные данные: ${JSON.stringify(req.body)}`)
  const user_email_check = await prisma.user.findMany({ where: { email } })
  console.log(`Email адрес в базе данных: ${JSON.stringify(user_email_check)}`)
  if (!Object.keys(user_email_check).length) {
    const user_create: User = await prisma.user.create({ data: { password, email } })
    console.log(`Создан новый пользователь: ${JSON.stringify(user_create)}`)
    const user_create_account: Account = await prisma.account.create({ data: { name: "Test", id_user: user_create.id } })
    console.log(`Подготовлена таблица аккаунта для зарегестрированного пользователя: ${JSON.stringify(user_create_account)}`)
    answer.status = 'User created'
  } else {
    const user_password_check = await prisma.user.findFirst({ where: { email, password } })
    console.log(`Пользователь: ${JSON.stringify(user_password_check)} авторизовался`)
    if (user_password_check != null) {  
      if (!Object.keys(user_password_check).length) {
        answer.status = 'User login incorrect'
      } else {
        const token = user_password_check.id
        answer.status = 'User login success'
        answer.token = token
      }
    } else {
      answer.status = 'User login failed'
    }
  }
  return NextResponse.json(answer);
}