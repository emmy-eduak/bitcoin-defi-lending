;; title: BTC DeFi Loan Smart Contract
;; summary: A decentralized finance (DeFi) smart contract for managing BTC loans with enhanced security and safety features.
;; description: This smart contract allows users to deposit and withdraw BTC, create and join mixer pools, and distribute pool funds with a mixing fee. It includes enhanced safety and security checks, emergency pause functionality, and the ability to withdraw protocol fees by the contract owner. The contract also provides read-only functions to get user balances, daily limit remaining, contract status, and pool details.


;; constants
;; Contract Owner
(define-constant CONTRACT-OWNER tx-sender)

;; Error Constants
(define-constant ERR-NOT-AUTHORIZED (err u1000))
(define-constant ERR-INVALID-AMOUNT (err u1001))
(define-constant ERR-INSUFFICIENT-BALANCE (err u1002))
(define-constant ERR-CONTRACT-NOT-INITIALIZED (err u1003))
(define-constant ERR-ALREADY-INITIALIZED (err u1004))
(define-constant ERR-POOL-FULL (err u1005))
(define-constant ERR-DAILY-LIMIT-EXCEEDED (err u1006))
(define-constant ERR-INVALID-POOL (err u1007))
(define-constant ERR-DUPLICATE-PARTICIPANT (err u1008))
(define-constant ERR-INSUFFICIENT-POOL-FUNDS (err u1009))
(define-constant ERR-POOL-NOT-READY (err u1010))

;; Contract Configuration Constants
(define-constant MAX-DAILY-LIMIT u10000000000)
(define-constant MAX-POOL-PARTICIPANTS u10)
(define-constant MAX-TRANSACTION-AMOUNT u1000000000000)
(define-constant MIN-POOL-AMOUNT u100000)
(define-constant MIXING-FEE-PERCENTAGE u2) ;; 2% mixing fee

;; State Variables
(define-data-var is-contract-initialized bool false)
(define-data-var is-contract-paused bool false)
(define-data-var total-protocol-fees uint u0)

;; Data Maps
(define-map user-balances 
    principal 
    uint)

(define-map daily-tx-totals 
    {user: principal, day: uint}
    uint)

(define-map mixer-pools 
    uint 
    {
        total-amount: uint,
        participant-count: uint,
        is-active: bool,
        participants: (list 10 principal),
        pool-creator: principal
    })

(define-map pool-participant-status 
    {pool-id: uint, user: principal}
    bool)