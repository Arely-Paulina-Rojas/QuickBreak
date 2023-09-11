package com.example.quickbreak.adaptadores;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


import com.example.quickbreak.MainActivity;
import com.example.quickbreak.Modificar;
import com.example.quickbreak.R;
import com.example.quickbreak.db.DbRecordatorios;
import com.example.quickbreak.entidades.Recordatorio;

import org.w3c.dom.Text;

import java.util.ArrayList;

public class ListaRecordatoriosAdapter extends RecyclerView.Adapter<ListaRecordatoriosAdapter.RecordatorioViewHolder> {
    ArrayList<Recordatorio> listaRecordatorios;
    public ListaRecordatoriosAdapter(ArrayList<Recordatorio> listaRecordatorios){
        this.listaRecordatorios = listaRecordatorios;

    }

    @NonNull
    @Override
    public RecordatorioViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.lista_item_recordatorio, null, false);
        return new RecordatorioViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull RecordatorioViewHolder recordatorioViewHolder, int i) {
        recordatorioViewHolder.txtNombre.setText(listaRecordatorios.get(i).getNombre());

    }

    @Override
    public int getItemCount() {
        return listaRecordatorios.size();
    }

    public class RecordatorioViewHolder extends RecyclerView.ViewHolder {
        TextView txtNombre;
        Button btnModificar;
        Button btnEliminar;
        Button btnIniciar;

        public RecordatorioViewHolder(@NonNull View itemView) {
            super(itemView);
            txtNombre = itemView.findViewById(R.id.txtNombre);
            btnModificar = itemView.findViewById(R.id.btnModificar);
            btnEliminar = itemView.findViewById(R.id.btnEliminar);
            btnIniciar = itemView.findViewById(R.id.btnIniciar);

            btnModificar.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Context context = view.getContext();
                    Intent intent = new Intent(context, Modificar.class);
                    intent.putExtra("ID", listaRecordatorios.get(getAdapterPosition()).getId());
                    context.startActivity(intent);
                }
            });

            btnEliminar.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Context context = view.getContext();
                    Recordatorio recordatorio;
                    DbRecordatorios dbRecordatorios = new DbRecordatorios(context);
                    AlertDialog.Builder builder = new AlertDialog.Builder(context);
                    builder.setMessage("¿Desea eliminar el recordatorio?").setPositiveButton("Aceptar", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            boolean correcto = dbRecordatorios.eliminarRecordatorio(listaRecordatorios.get(getAdapterPosition()).getId());
                            if(correcto){
                                Toast.makeText(context, "Recordatorio eliminado", Toast.LENGTH_LONG).show();
                                Intent intent = new Intent(context, MainActivity.class);
                                context.startActivity(intent);
                            }else{
                                Toast.makeText(context, "Error al eliminar recordatorio ", Toast.LENGTH_LONG).show();
                            }

                        }
                    }).setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {

                        }
                    }).show();
                }
            });

            btnIniciar.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Context context = view.getContext();
                    Intent intent = new Intent(context,MainActivity.class);
                    intent.putExtra("TIEMPO", listaRecordatorios.get(getAdapterPosition()).getTiempo());
                    intent.putExtra("ACTIVIDAD", listaRecordatorios.get(getAdapterPosition()).getActividad());
                    context.startActivity(intent);
                }
            });
        }


    }
}
