import { NextRequest, NextResponse } from "next/server";
import { NextApiRequest, NextApiResponse } from "next";
import { Account, User } from "@prisma/client";
import prisma from "../module/prisma";

export async function GET(request: NextRequest, res: NextResponse<Response>) {
  const req = await request.json()
  const { token } = req
  console.log(req)
  console.log(`Входные данные: ${JSON.stringify(req.body)}`)
  const account = await prisma.account.findFirst({ where: { id_user: Number(token) } })
  console.log(`Полученые данные аккаунта: ${JSON.stringify(account)}`)
  return NextResponse.json(account);
}