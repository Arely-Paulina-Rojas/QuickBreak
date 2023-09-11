package com.example.quickbreak;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.Button;
import android.widget.TextView;

import com.example.quickbreak.adaptadores.ListaRecordatoriosAdapter;
import com.example.quickbreak.db.DbRecordatorios;
import com.example.quickbreak.entidades.Recordatorio;

import java.util.ArrayList;

//AppCompatActivity
public class MainActivity extends AppCompatActivity {
    MediaPlayer mother;
    Button btnAgregar;
    Button btnModificar;
    Button btnInicio;
    Button btnReiniciar;
    TextView txtTiempo;
    CountDownTimer temporizador;
    boolean relojCorriendo;
    long iniciarTiempoMilisegundos;
    long tiempoRestanteMilisegundos;
    long tiempoFinalizado;
    RecyclerView viewRecordatorios;
    ArrayList<Recordatorio> listaRecordatorios;
    int tiempo;
    String actividad;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnAgregar = findViewById(R.id.btnAgregar);

        viewRecordatorios = findViewById(R.id.viewRecordatorios);

        viewRecordatorios.setLayoutManager(new LinearLayoutManager(this));
        DbRecordatorios dbRecordatorios = new DbRecordatorios(MainActivity.this);

        listaRecordatorios = new ArrayList<>();

        ListaRecordatoriosAdapter adapter = new ListaRecordatoriosAdapter(dbRecordatorios.mostrarRecordatorios());

        //btnModificar = findViewById(R.id.btnModificar);

        //Aplicacion siempre activa
    }
}