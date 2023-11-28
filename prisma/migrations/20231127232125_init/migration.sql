-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Account" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL DEFAULT 1,
    "xp" REAL NOT NULL DEFAULT 0,
    "gold" REAL NOT NULL DEFAULT 5000,
    "iron" REAL NOT NULL DEFAULT 500,
    "crystal" INTEGER NOT NULL DEFAULT 0,
    "energy" REAL NOT NULL DEFAULT 1000,
    "research" REAL NOT NULL DEFAULT 0,
    "reputation" REAL NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'player',
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_corporation" INTEGER NOT NULL DEFAULT 0,
    "id_user" INTEGER NOT NULL,
    CONSTRAINT "Account_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "System" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "planet" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Planet" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "coal" REAL NOT NULL,
    "gas" REAL NOT NULL,
    "oil" REAL NOT NULL,
    "uranium" REAL NOT NULL,
    "iron" REAL NOT NULL,
    "golden" REAL NOT NULL,
    "crystal" REAL NOT NULL,
    "area" INTEGER NOT NULL DEFAULT 128,
    "artefact" REAL NOT NULL,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_user" INTEGER,
    "id_system" INTEGER NOT NULL,
    CONSTRAINT "Planet_id_system_fkey" FOREIGN KEY ("id_system") REFERENCES "System" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Builder" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL DEFAULT 1,
    "cost" TEXT,
    "input" TEXT,
    "storage" TEXT,
    "output" TEXT,
    "require" TEXT,
    "id_planet" INTEGER,
    "id_user" INTEGER,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Worker" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL DEFAULT 1,
    "xp" REAL NOT NULL DEFAULT 0,
    "atk" REAL NOT NULL DEFAULT 1,
    "def" REAL NOT NULL DEFAULT 2,
    "hp" REAL NOT NULL DEFAULT 5,
    "speed" REAL NOT NULL DEFAULT 1,
    "salary" REAL NOT NULL DEFAULT 1,
    "gold" REAL NOT NULL DEFAULT 0,
    "reputation" REAL NOT NULL DEFAULT 0,
    "point" INTEGER NOT NULL DEFAULT 0,
    "id_builder" INTEGER,
    "id_planet" INTEGER,
    "id_user" INTEGER,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Corporation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "id_user" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL DEFAULT 1,
    "xp" REAL NOT NULL DEFAULT 0,
    "gold" REAL NOT NULL DEFAULT 1750,
    "energy" REAL NOT NULL DEFAULT 1750,
    "reputation" REAL NOT NULL DEFAULT 0,
    "member" INTEGER NOT NULL DEFAULT 6,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Corporation_Builder" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL DEFAULT 1,
    "type" TEXT NOT NULL,
    "income" REAL NOT NULL DEFAULT 1,
    "cost" REAL NOT NULL DEFAULT 100,
    "worker" INTEGER NOT NULL DEFAULT 1,
    "id_corporation" INTEGER NOT NULL,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Corporation_Builder_id_corporation_fkey" FOREIGN KEY ("id_corporation") REFERENCES "Corporation" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Research" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lvl" INTEGER NOT NULL,
    "id_account" INTEGER NOT NULL,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Research_id_account_fkey" FOREIGN KEY ("id_account") REFERENCES "Account" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Statistics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "all" TEXT NOT NULL,
    "day" TEXT NOT NULL,
    "week" TEXT NOT NULL,
    "month" TEXT NOT NULL,
    "id_account" INTEGER NOT NULL,
    "crdate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Statistics_id_account_fkey" FOREIGN KEY ("id_account") REFERENCES "Account" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Account_id_user_key" ON "Account"("id_user");
