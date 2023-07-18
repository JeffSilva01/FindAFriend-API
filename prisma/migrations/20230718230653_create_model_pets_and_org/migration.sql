-- CreateEnum
CREATE TYPE "Port" AS ENUM ('MN', 'P', 'M', 'G', 'XG');

-- CreateEnum
CREATE TYPE "LevelOfIndependence" AS ENUM ('P', 'M', 'G');

-- CreateTable
CREATE TABLE "org" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "road" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "zip_code" TEXT NOT NULL,
    "number" INTEGER NOT NULL,

    CONSTRAINT "org_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pets" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "energy_level" INTEGER NOT NULL,
    "post" "Port" NOT NULL,
    "level_of_independence" "LevelOfIndependence" NOT NULL,
    "species" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "adopted_in" TIMESTAMP(3),
    "org_id" TEXT NOT NULL,

    CONSTRAINT "pets_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "org_email_key" ON "org"("email");

-- AddForeignKey
ALTER TABLE "pets" ADD CONSTRAINT "pets_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
