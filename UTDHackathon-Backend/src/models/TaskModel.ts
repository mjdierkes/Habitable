import * as mongoose from 'mongoose';
import { getModelForClass, prop } from "@typegoose/typegoose";
import { Group } from './GroupModel';

export class Task {
    @prop({ required: true })
    public name: string;

    @prop({ required: true })
    public complete: boolean
};

export default getModelForClass(Task);