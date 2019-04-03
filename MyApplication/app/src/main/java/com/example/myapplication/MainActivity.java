package com.example.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    EditText e1,e2;
    Button b1,b2;
    String s1,s2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        e1=findViewById(R.id.e1);
        e2=findViewById(R.id.e2);
        b1=findViewById(R.id.b1);
        b2=findViewById(R.id.b2);
        s1=String.valueOf(e1.getText());
        s2=String.valueOf(e2.getText());
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                e1.setText(null);
                e2.setText(null);
            }
        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                e1.setText(s2);
                e2.setText(s1);
            }
        });
    }
}
