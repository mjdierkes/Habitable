import express, { NextFunction } from "express";
import { Request, Response } from "express";
import mongoose from "mongoose";

import userRouter from "./routes/userRoutes";
import groupRouter from "./routes/groupRoutes";

const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());
app.use("/users", userRouter);
app.use("/groups", groupRouter);

mongoose.connect("mongodb+srv://sumitn:1234@cluster0.tmmpa.mongodb.net/?retryWrites=true&w=majority");

app.listen(PORT, () => {
    // tslint:disable-next-line:no-console
    console.log(`Express app listening on PORT ${PORT}`);
});

app.get("/", (req: Request, res: Response) => {
    res.send("Hello World");
});

// Generic error handler
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
    const { message } = err;

    res.status(500).send(message);
});