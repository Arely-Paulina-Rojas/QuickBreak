package com.example.quickbreak.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.annotation.Nullable;

import com.example.quickbreak.entidades.Recordatorio;

import java.util.ArrayList;

public class DbRecordatorios extends DbHelper{

    Context context;

    public DbRecordatorios(@Nullable Context context){
        super(context);
        this.context = context;

    }

    public long insertarRecordatorios(String nombre, String tiempo, String descanso, String actividad){
       long id = 0;
        try {
            DbHelper dbHelper = new DbHelper(context);
            SQLiteDatabase db = dbHelper.getWritableDatabase();

            ContentValues values = new ContentValues();
            values.put("nombre", nombre);
            values.put("tiempo", tiempo);
            values.put("descanso", descanso);
            values.put("actividad", actividad);

            id = db.insert(TABLE_RECORDATORIOS, null, values);
        }catch (Exception ex){
            ex.toString();
        }
        return id;
    }

    public ArrayList<Recordatorio> mostrarRecordatorios(){
        DbHelper dbHelper = new DbHelper(context);
        SQLiteDatabase db = dbHelper.getWritableDatabase();

        ArrayList<Recordatorio> listaRecordatorios = new ArrayList<>();
        Recordatorio recordatorio = null;
        Cursor cursorRecordatorio = null;

        cursorRecordatorio = db.rawQuery( "SELECT id, nombre, tiempo, actividad FROM " + TABLE_RECORDATORIOS, null);
        if(cursorRecordatorio.moveToFirst()){
            do{
                recordatorio = new Recordatorio();
                recordatorio.setId(cursorRecordatorio.getInt(0));
                recordatorio.setNombre(cursorRecordatorio.getString(1));
                recordatorio.setTiempo(cursorRecordatorio.getString(2));
                recordatorio.setActividad(cursorRecordatorio.getString(3));
                listaRecordatorios.add(recordatorio);
            }while(cursorRecordatorio.moveToNext());
        }

        cursorRecordatorio.close();
        return listaRecordatorios;
    }

    public Recordatorio mostrarRecordatorio(int id){
        DbHelper dbHelper = new DbHelper(context);
        SQLiteDatabase db = dbHelper.getWritableDatabase();

        Recordatorio recordatorio = null;
        Cursor cursorRecordatorio;

        cursorRecordatorio = db.rawQuery( "SELECT * FROM " + TABLE_RECORDATORIOS + " WHERE id = " + id + " LIMIT 1", null);
        if(cursorRecordatorio.moveToFirst()){
                recordatorio = new Recordatorio();
                recordatorio.setId(cursorRecordatorio.getInt(0));
                recordatorio.setNombre(cursorRecordatorio.getString(1));
                recordatorio.setTiempo(cursorRecordatorio.getString(2));
                recordatorio.setDescanso(cursorRecordatorio.getString(3));
                recordatorio.setActividad(cursorRecordatorio.getString(4));

        }

        cursorRecordatorio.close();
        return recordatorio;
    }

    public boolean editarRecordatorios(int id, String nombre, String tiempo, String descanso, String actividad){
        boolean correcto = false;

        DbHelper dbHelper = new DbHelper(context);
        SQLiteDatabase db = dbHelper.getWritableDatabase();

        try {
            db.execSQL("UPDATE " + TABLE_RECORDATORIOS + " SET nombre = '" + nombre +"', tiempo = '" + tiempo +"', descanso = '" + descanso +"', actividad = '" + actividad + "' WHERE id = '" + id + "' ");
            correcto = true;
        }catch (Exception ex){
            ex.toString();
            correcto = false;
        } finally {
            db.close();
        }
        return correcto;
    }

    public boolean eliminarRecordatorio(int id){
        boolean correcto = false;

        DbHelper dbHelper = new DbHelper(context);
        SQLiteDatabase db = dbHelper.getWritableDatabase();

        try {
            db.execSQL("DELETE FROM " + TABLE_RECORDATORIOS + " WHERE id = '" + id + "'");
            correcto = true;
        }catch (Exception ex){
            ex.toString();
            correcto = false;
        } finally {
            db.close();
        }
        return correcto;
    }

}
