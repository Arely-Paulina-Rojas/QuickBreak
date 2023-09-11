package com.example.quickbreak;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Button;
import android.widget.Toast;

import com.example.quickbreak.db.DbRecordatorios;
import com.example.quickbreak.entidades.Recordatorio;

public class Modificar extends AppCompatActivity {

    Button btnCancelarM;
    EditText etxtNombreM;
    EditText etxtTiempoM;
    EditText etxtDescansoM;
    Button btnGuardarM;
    boolean correcto = false;

    Recordatorio recordatorio;
    int id = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_modificar);
        etxtNombreM = findViewById(R.id.etxtNombreM);
        etxtTiempoM = findViewById(R.id.etxtTiempoM);
        etxtDescansoM = findViewById(R.id.etxtDescansoM);

        btnGuardarM = findViewById(R.id.btnGuardarM);
        Spinner spActividadM=findViewById(R.id.spActividadM);
        ArrayAdapter<CharSequence> adapter=ArrayAdapter.createFromResource(this, R.array.spActividad, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spActividadM.setAdapter(adapter);

        if(savedInstanceState == null){
            Bundle extras = getIntent().getExtras();
            if(extras == null){
                id = Integer.parseInt(null);
            }else{
                id = extras.getInt("ID");
            }
        }else{
            id = (int) savedInstanceState.getSerializable("ID");
        }

        DbRecordatorios dbRecordatorios = new DbRecordatorios(Modificar.this);
        recordatorio = dbRecordatorios.mostrarRecordatorio(id);

        if(recordatorio != null){
            etxtNombreM.setText(recordatorio.getNombre());
            etxtTiempoM.setText(recordatorio.getTiempo());
            etxtDescansoM.setText(recordatorio.getDescanso());

        }


        btnCancelarM = findViewById(R.id.btnCancelarM);
        btnCancelarM.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(Modificar.this, MainActivity.class);
                startActivity(intent);
            }
        });

        btnGuardarM.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(!etxtNombreM.getText().toString().equals("") && !etxtTiempoM.getText().toString().equals("") && !etxtDescansoM.getText().toString().equals("")){
                    correcto = dbRecordatorios.editarRecordatorios(id, etxtNombreM.getText().toString(), etxtTiempoM.getText().toString(), etxtDescansoM.getText().toString(), spActividadM.getSelectedItem().toString());

                    if(correcto){
                        Toast.makeText(Modificar.this, "Recordatorio actualizado", Toast.LENGTH_LONG).show();
                    }else {
                        Toast.makeText(Modificar.this, "Error al actualizar el recordatorio", Toast.LENGTH_LONG).show();
                    }
                }else{
                    Toast.makeText(Modificar.this, "Es necesario que todos los campos esten llenos", Toast.LENGTH_LONG).show();
                }
            }
        });
    }
}