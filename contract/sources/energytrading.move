module sadiq_addr::energy_trading {

    use std::signer;
    use std::vector;
    use std::error;
    use std::table;


struct EnergyListing has store, key {
    seller: address,
    units: u64,
    price_per_unit: u64,
}

    struct Listings has key {
        listings: table::Table<u64, EnergyListing>,
        next_id: u64,
    }

    public fun init(account: &signer) {
        move_to(account, Listings {
            listings: table::new<u64, EnergyListing>(),
            next_id: 0,
        });
    }

   public fun list_energy(account: &signer, units: u64, price_per_unit: u64) acquires Listings {
        let addr = signer::address_of(account);
        let listings_ref = borrow_global_mut<Listings>(addr);
        let id = listings_ref.next_id;
        let entry = EnergyListing { seller: addr, units, price_per_unit };
        table::add(&mut listings_ref.listings, id, entry);
        listings_ref.next_id = id + 1;
    }

    public fun buy_energy(buyer: &signer, seller: address, id: u64, units: u64, payment: u64) acquires Listings {
        let listings_ref = borrow_global_mut<Listings>(seller);
        let listing = table::borrow_mut(&mut listings_ref.listings, id);
        assert!(listing.units >= units, 1);
        let required_payment = units * listing.price_per_unit;
        assert!(payment >= required_payment, 2);
        listing.units = listing.units - units;
        // In real case, transfer payment to seller here
    }
}
