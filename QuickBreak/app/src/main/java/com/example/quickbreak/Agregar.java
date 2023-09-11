package com.example.quickbreak;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.quickbreak.db.DbRecordatorios;

public class Agregar extends AppCompatActivity {
    EditText etxtNombre;
    EditText etxtTiempo;
    EditText etxtDescanso;
    Button btnCancelar;
    Button btnGuardar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_agregar);
        etxtNombre = findViewById(R.id.etxtNombre);
        etxtTiempo = findViewById(R.id.etxtTiempo);
        etxtDescanso = findViewById(R.id.etxtDescanso);

        Spinner spActividad = findViewById(R.id.spActividad);
        ArrayAdapter<CharSequence>adapter=ArrayAdapter.createFromResource(this, R.array.spActividad, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spActividad.setAdapter(adapter);

        btnCancelar = findViewById(R.id.btnCancelar);
        btnGuardar = findViewById(R.id.btnGuardar);

        btnCancelar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               Intent intent=new Intent(Agregar.this, MainActivity.class);
               startActivity(intent);

            }
        });

        btnGuardar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DbRecordatorios dbRecordatorios = new DbRecordatorios(Agregar.this);
                if(!etxtNombre.getText().toString().equals("") && !etxtTiempo.getText().toString().equals("") && !etxtDescanso.getText().toString().equals("")){
                    long id = dbRecordatorios.insertarRecordatorios(etxtNombre.getText().toString(), etxtTiempo.getText().toString(), etxtDescanso.getText().toString(), spActividad.getSelectedItem().toString());
                    if(id > 0){
                        Toast.makeText(Agregar.this, "Recordatorio creado", Toast.LENGTH_LONG).show();
                        limpiar();
                    }else{
                        Toast.makeText(Agregar.this, "Error al crear el recordatorio", Toast.LENGTH_LONG).show();
                    }
                }else{
                    Toast.makeText(Agregar.this, "Es necesario que todos los campos esten llenos", Toast.LENGTH_LONG).show();
                }
        }
        });


    }

    private void limpiar(){
        etxtNombre.setText("");
        etxtTiempo.setText("");
        etxtDescanso.setText("");
    }
}