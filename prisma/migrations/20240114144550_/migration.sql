/*
  Warnings:

  - Added the required column `durationEnabled` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Task" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "durationEnabled" BOOLEAN NOT NULL,
    "start" DATETIME NOT NULL,
    "end" DATETIME NOT NULL,
    "allDay" BOOLEAN NOT NULL,
    "done" BOOLEAN NOT NULL,
    "priorityLevelId" INTEGER NOT NULL,
    "taskCategoryId" INTEGER NOT NULL,
    "taskBoardId" TEXT NOT NULL,
    CONSTRAINT "Task_priorityLevelId_fkey" FOREIGN KEY ("priorityLevelId") REFERENCES "PriorityLevel" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Task_taskCategoryId_fkey" FOREIGN KEY ("taskCategoryId") REFERENCES "TaskCategory" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Task_taskBoardId_fkey" FOREIGN KEY ("taskBoardId") REFERENCES "TaskBoard" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Task" ("allDay", "description", "done", "end", "id", "priorityLevelId", "start", "taskBoardId", "taskCategoryId", "title") SELECT "allDay", "description", "done", "end", "id", "priorityLevelId", "start", "taskBoardId", "taskCategoryId", "title" FROM "Task";
DROP TABLE "Task";
ALTER TABLE "new_Task" RENAME TO "Task";
CREATE UNIQUE INDEX "Task_id_key" ON "Task"("id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
