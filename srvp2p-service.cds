using p2p from '../db/schema';

service P2PService {

    entity Materials as projection on p2p.Material;
    entity Vendors as projection on p2p.Vendor;

    entity PurchaseRequisitions as projection on p2p.PurchaseRequisition;
    entity PurchaseOrders as projection on p2p.PurchaseOrder;
    entity GoodsReceipts as projection on p2p.GoodsReceipt;
    entity Invoices as projection on p2p.Invoice;
    entity Payments as projection on p2p.Payment;

    action createPO(requisitionID: UUID) returns PurchaseOrders;
    action postGoodsReceipt(poID: UUID, quantity: Integer);
    action verifyInvoice(poID: UUID, amount: Decimal);
    action makePayment(invoiceID: UUID);
}