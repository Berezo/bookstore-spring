package org.example.adapter;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.util.Date;
import java.sql.Timestamp;

public class TimestampAdapter extends XmlAdapter<Date, Timestamp> {
    public Date marshal(Timestamp v) {
        return new Date(v.getTime());
    }
    public Timestamp unmarshal(Date v) {
        return new Timestamp(v.getTime());
    }
}