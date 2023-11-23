import { NextRequest, NextResponse } from "next/server";

export async function GET(request: NextRequest) {
  const user = { name: "Test", res: "dgsg"}
  return NextResponse.json(user);
}