import { NextRequest, NextResponse } from "next/server";

export async function GET(request: NextRequest) {
  const user = { name: "Planet", res: "11132"}
  return NextResponse.json(user);
}