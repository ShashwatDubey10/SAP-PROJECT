const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { PurchaseRequisition, PurchaseOrder, GoodsReceipt, Invoice, Payment } = this.entities;

    this.on('createPO', async (req) => {
        const { requisitionID } = req.data;

        const pr = await SELECT.one.from(PurchaseRequisition).where({ ID: requisitionID });

        if (!pr) return req.error(404, 'PR not found');

        const po = await INSERT.into(PurchaseOrder).entries({
            requisition_ID: requisitionID,
            totalAmount: pr.quantity * 100, // dummy pricing logic
            status: 'CREATED'
        });

        return po;
    });

    this.on('postGoodsReceipt', async (req) => {
        const { poID, quantity } = req.data;

        await INSERT.into(GoodsReceipt).entries({
            purchaseOrder_ID: poID,
            quantity
        });

        return "GR Posted";
    });

    this.on('verifyInvoice', async (req) => {
        const { poID, amount } = req.data;

        const invoice = await INSERT.into(Invoice).entries({
            purchaseOrder_ID: poID,
            amount,
            status: 'VERIFIED'
        });

        return invoice;
    });

    this.on('makePayment', async (req) => {
        const { invoiceID } = req.data;

        const inv = await SELECT.one.from(Invoice).where({ ID: invoiceID });

        await INSERT.into(Payment).entries({
            invoice_ID: invoiceID,
            amount: inv.amount
        });

        return "Payment Completed";
    });

});