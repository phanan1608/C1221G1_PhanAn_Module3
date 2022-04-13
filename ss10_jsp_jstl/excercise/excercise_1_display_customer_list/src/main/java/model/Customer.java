package model;

public class Customer {
    private String name;
    private String dayOfBirth;
    private int gender;
    private String address;
    private Double score;
    private String imageLink;

    public Customer(String name, String dayOfBirth, int gender, String address, Double score, String imageLink) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.address = address;
        this.score = score;
        this.imageLink = imageLink;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
}
