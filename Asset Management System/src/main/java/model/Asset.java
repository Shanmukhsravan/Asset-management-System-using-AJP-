package model;

public class Asset {
    private int assetId;
    private String name;
    private String description;
    private double value;

    // Constructors
    public Asset() {}

    public Asset(int assetId, String name, String description, double value) {
        this.assetId = assetId;
        this.name = name;
        this.description = description;
        this.value = value;
    }

    // Getters and Setters
    public int getAssetId() { return assetId; }
    public void setAssetId(int assetId) { this.assetId = assetId; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getValue() { return value; }
    public void setValue(double value) { this.value = value; }
}
