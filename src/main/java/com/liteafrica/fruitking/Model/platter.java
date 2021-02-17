package com.liteafrica.fruitking.Model;

public class platter {

    public String Name;
    public String Description;
    public String Photo;
    public String Booking_date;
    public String Booking_time;
    public String PlatterID;
    public String Message;
    public String FinalMessage;

    public String getOccasion(int p) {
        return Occasion;
    }

    public void setOccasion(String occasion) {
        Occasion = occasion;
    }

    public String Occasion;

    public String getPrice(int p) {
        return Price;
    }

    public void setPrice(String price) {
        Price = price;
    }

    public String Price;
    public int ID,Status;

    public String getName(int p) {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getDescription(int p) {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getPhoto(int p) {
        return Photo;
    }

    public void setPhoto(String photo) {
        Photo = photo;
    }

    public int getID(int p) {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getBooking_date(int p) {
        return Booking_date;
    }

    public void setBooking_date(String booking_date) {
        Booking_date = booking_date;
    }

    public String getBooking_time(int p) {
        return Booking_time;
    }

    public void setBooking_time(String booking_time) {
        Booking_time = booking_time;
    }

    public String getPlatterID(int p) {
        return PlatterID;
    }

    public void setPlatterID(String platterID) {
        PlatterID = platterID;
    }

    public String getMessage(int p) {
        return Message;
    }

    public void setMessage(String message) {
        Message = message;
    }

    public String getFinalMessage(int p) {
        return FinalMessage;
    }

    public void setFinalMessage(String finalMessage) {
        FinalMessage = finalMessage;
    }

    public int getStatus(int p) {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }
}
