namespace p2p;

entity Material {
    key ID        : UUID;
    name          : String;
    type          : String; // ROH, HALB
    price         : Decimal(10,2);
}

entity Vendor {
    key ID        : UUID;
    name          : String;
    paymentTerms  : String;
}

entity PurchaseRequisition {
    key ID        : UUID;
    material      : Association to Material;
    quantity      : Integer;
    plant         : String;
    status        : String; // CREATED, APPROVED
}

entity PurchaseOrder {
    key ID        : UUID;
    vendor        : Association to Vendor;
    requisition   : Association to PurchaseRequisition;
    totalAmount   : Decimal(10,2);
    status        : String; // CREATED, RELEASED
}

entity GoodsReceipt {
    key ID        : UUID;
    purchaseOrder : Association to PurchaseOrder;
    quantity      : Integer;
}

entity Invoice {
    key ID        : UUID;
    purchaseOrder : Association to PurchaseOrder;
    amount        : Decimal(10,2);
    status        : String; // VERIFIED
}

entity Payment {
    key ID        : UUID;
    invoice       : Association to Invoice;
    amount        : Decimal(10,2);
}