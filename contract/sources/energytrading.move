module sadiq_addr::energy_market {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::event;

    /// Error codes
    const E_INSUFFICIENT_ENERGY: u64 = 1;
    const E_INSUFFICIENT_FUNDS: u64 = 2;
    const E_INVALID_AMOUNT: u64 = 3;

    /// Energy account structure
    struct EnergyAccount has key {
        energy_balance: u64,
        total_sold: u64,
        total_bought: u64,
    }

    /// Events
    #[event]
    struct EnergyTradeEvent has drop, store {
        seller: address,
        buyer: address,
        energy_amount: u64,
        price_per_unit: u64,
        total_cost: u64,
    }

    /// Initialize energy account for a user
    public entry fun initialize_account(account: &signer) {
        let account_addr = signer::address_of(account);
        
        if (!exists<EnergyAccount>(account_addr)) {
            move_to(account, EnergyAccount {
                energy_balance: 0,
                total_sold: 0,
                total_bought: 0,
            });
        };
    }

    /// Sell energy to another user
    public entry fun sell_energy(
        seller: &signer,
        buyer_addr: address,
        energy_amount: u64,
        price_per_unit: u64
    ) acquires EnergyAccount {
        let seller_addr = signer::address_of(seller);
        assert!(exists<EnergyAccount>(seller_addr), E_INSUFFICIENT_ENERGY);
        assert!(exists<EnergyAccount>(buyer_addr), E_INSUFFICIENT_ENERGY);
        assert!(energy_amount > 0, E_INVALID_AMOUNT);

        let seller_account = borrow_global_mut<EnergyAccount>(seller_addr);
        assert!(seller_account.energy_balance >= energy_amount, E_INSUFFICIENT_ENERGY);

        let total_cost = energy_amount * price_per_unit;
        
        // Transfer payment from buyer to seller
        coin::transfer<AptosCoin>(seller, seller_addr, total_cost);
        
        // Update energy balances
        seller_account.energy_balance = seller_account.energy_balance - energy_amount;
        seller_account.total_sold = seller_account.total_sold + energy_amount;

        let buyer_account = borrow_global_mut<EnergyAccount>(buyer_addr);
        buyer_account.energy_balance = buyer_account.energy_balance + energy_amount;
        buyer_account.total_bought = buyer_account.total_bought + energy_amount;

        // Emit trade event
        event::emit(EnergyTradeEvent {
            seller: seller_addr,
            buyer: buyer_addr,
            energy_amount,
            price_per_unit,
            total_cost,
        });
    }
}