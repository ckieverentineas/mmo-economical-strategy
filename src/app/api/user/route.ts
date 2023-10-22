import { NextRequest, NextResponse } from "next/server";

export async function GET(request: NextRequest) {
  const user = { name: "Jo", age: "29"}
  return NextResponse.json(user);
}