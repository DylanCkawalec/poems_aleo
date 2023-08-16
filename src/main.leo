// The 'randomnesspoems1reyza' program.

program randomnesspoems1reyza.aleo {
    // see if nonce checks are good for building random serial entropy's, to commit a field with a random scalar, and then ziffie. 
    // Define a record to store account-related information.
    record AccountQueryRecord {
        node_id: field,
        game_id: field,
        pool_id: field,
        account_id: field,
        asset_id: field,
        owner: address,
        diffie: scalar,         // Scalar value for cryptographic operations.
        diffie_bruh: scalar,    // Another scalar value for cryptographic operations.
        z1: field,              // Fields for storing zk-SNARKs related data.
        z2: field, 
        z3: field, 
        z4: field,
        z5: field, 
    }
    
    // Function to generate a field using BHP256 hash and commit functions.
    function generate_field(x: field, y: scalar) -> field {
        let final: field = BHP256::hash_to_field(x);
        let mixxy: scalar = BHP256::hash_to_scalar(y);
        let showdown: field = BHP256::commit_to_field(final, mixxy);

        return showdown;
    }

    // Function to generate zk-SNARKs related field.
    function generate_ziffie(x: field, y: scalar) -> field {
        let final: field = BHP256::hash_to_field(x);
        let mixxy: scalar = BHP256::hash_to_scalar(y);
        let showdown: field = BHP256::commit_to_field(final, mixxy);

        return showdown;
    }

    // Function to generate a scalar using BHP256 hash.
    function generate_scalar(y: scalar) -> scalar {
        let dixxy: scalar = BHP256::hash_to_scalar(y);
        return dixxy;
    }

    // Transition function to play the game and return an AccountQueryRecord.
    transition interpretations(long_string: field, long_int: field, string_set: field, owner_address: address, ziffie_scalar: scalar) -> AccountQueryRecord {
        // Generate scalar values for cryptographic operations.
        let diffie1: scalar = generate_scalar(ziffie_scalar);
        let diffie2: scalar = generate_scalar(ziffie_scalar.add(ziffie_scalar)); // this is a mixxer

        // Generate fields using the provided inputs and scalar values.
        let new_node_id: field = generate_field(long_string, diffie1);
        let zkdid1: field = generate_ziffie(new_node_id, diffie1);

        let new_game_id: field = generate_field(string_set, diffie2);
        let zkdid2: field = generate_ziffie(new_game_id, ziffie_scalar);

        let new_pool_id: field = generate_field(long_int * string_set, diffie2);
        let zkdid3: field = generate_ziffie(new_pool_id, diffie2);

        let new_account_id: field = generate_field(long_string + string_set, diffie1);
        let zkdid4: field = generate_ziffie(new_account_id, diffie1);

        let new_asset_id: field = generate_field(long_string * long_int, diffie1);
        let zkdid5: field = generate_ziffie(new_asset_id, ziffie_scalar);

        // Create an instance of the AccountQueryRecord with the generated values.
        let new_record: AccountQueryRecord = AccountQueryRecord {
            node_id: new_node_id,
            game_id: new_game_id,
            pool_id: new_pool_id,
            account_id: new_account_id,
            asset_id: new_asset_id,
            owner: owner_address, 
            diffie: diffie1, 
            diffie_bruh: diffie2, 
            z1: zkdid1,
            z2: zkdid2,
            z3: zkdid3,
            z4: zkdid4,
            z5: zkdid5
        };

        return new_record;
    }
}

