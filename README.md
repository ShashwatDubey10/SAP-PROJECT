# SAP BTP Procure-to-Pay (P2P) Application

## Overview
This project implements a simplified **Procure-to-Pay (P2P)** cycle using **SAP BTP (Cloud Application Programming Model - CAP)** with Node.js.

It simulates the complete procurement workflow:
- Purchase Requisition (PR)
- Purchase Order (PO)
- Goods Receipt (GR)
- Invoice Verification
- Vendor Payment

---

## Architecture

- **Backend:** Node.js (CAP)
- **Database:** SQLite (Development)
- **Service Layer:** OData V4
- **Deployment Target:** SAP BTP (Cloud Foundry)

---

## Project Structure
.
├── db/
│   └── schema.cds
├── srv/
│   ├── p2p-service.cds
│   └── p2p-service.js
├── package.json
└── README.md

---

## Data Model

The application includes the following core entities:

- **Material**
- **Vendor**
- **PurchaseRequisition**
- **PurchaseOrder**
- **GoodsReceipt**
- **Invoice**
- **Payment**

---

## Business Flow Mapping

| Step | SAP Transaction | CAP Implementation |
|------|-----------------|-------------------|
| Purchase Requisition | ME51N | PurchaseRequisition entity |
| Purchase Order | ME21N | `createPO()` action |
| Goods Receipt | MIGO | `postGoodsReceipt()` |
| Invoice Verification | MIRO | `verifyInvoice()` |
| Payment | F110 | `makePayment()` |

---

## Setup Instructions

### 1. Install Dependencies

```bash
npm install
```

### 2. Run the Application

```bash
cds watch
```

### 3. Access Service
http://localhost:4004/

---

## API Endpoints

### Create Purchase Order
POST /p2p/createPO

### Post Goods Receipt
POST /p2p/postGoodsReceipt

### Verify Invoice
POST /p2p/verifyInvoice

### Make Payment
POST /p2p/makePayment

---

## Sample Workflow

1. Create a Purchase Requisition
2. Generate Purchase Order using `createPO`
3. Record Goods Receipt using `postGoodsReceipt`
4. Verify Invoice using `verifyInvoice`
5. Complete Payment using `makePayment`

---

## Features

- End-to-end P2P cycle simulation
- CAP-based modular architecture
- OData service exposure
- Easily extendable

---

## Limitations

- Uses simplified pricing logic
- No real SAP S/4HANA integration
- No frontend UI included

---

## Future Enhancements

- SAP Fiori UI integration
- Workflow approvals (SAP Build Process Automation)
- Integration with SAP S/4HANA APIs
- Analytics using SAP Analytics Cloud

---

## Author

**Shashwat Dubey**  
SAP BTP Project – Procure-to-Pay (P2P)
