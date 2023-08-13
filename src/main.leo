// program poemsdemo1nqvlm.aleo {

//     struct AccountQuery {
//         node_id: field,
//         game_id: field,
//         pool_id: field,
//         account_id: field,
//         asset_id: field,
//     }

//     function generate_hash(input: field) -> field {
//         return BHP256::hash_to_field(input);
//     }
    
//     transition main(long_string: field, long_int: field, string_set: field) -> AccountQuery {
//         // Generate 256-bit hashes for each field
//         let node_id: field = generate_hash(long_string);
//         let game_id: field = generate_hash(string_set);
//         let pool_id: field = generate_hash(long_int + string_set);
//         let account_id: field = generate_hash(long_string + string_set);
//         let asset_id: field = generate_hash(long_string + long_int);

//         // Create an instance of the AccountQuery struct
//         let account_query: AccountQuery = AccountQuery {
//             node_id: node_id,
//             game_id: game_id,
//             pool_id: pool_id,
//             account_id: account_id,
//             asset_id: asset_id,
//         };

//         return account_query then finalize(account_query);
//     }

//     finalize main(account_query: AccountQuery) {
//         // Introduce randomness using ChaCha in the finalize block
//         let random_node_id: field = account_query.node_id + ChaCha::rand_field();
//         let random_game_id: field = account_query.game_id + ChaCha::rand_field();
//         let random_pool_id: field = account_query.pool_id + ChaCha::rand_field();
//         let random_account_id: field = account_query.account_id + ChaCha::rand_field();
//         let random_asset_id: field = account_query.asset_id + ChaCha::rand_field();

//         // Assert that the randomized values are different from the original ones
//         assert_neq(random_node_id, account_query.node_id);
//         assert_neq(random_game_id, account_query.game_id);
//         assert_neq(random_pool_id, account_query.pool_id);
//         assert_neq(random_account_id, account_query.account_id);
//         assert_neq(random_asset_id, account_query.asset_id);
//     }
// }


program poemsdemo1nqvlm.aleo {

    struct AccountQuery {
        node_id: field,
        game_id: field,
        pool_id: field,
        account_id: field,
        asset_id: field,
    }

    function generate_hash(input: field) -> field {
        let x: field = BHP256::hash_to_field(input);
        return BHP256::commit_to_field(x, 1scalar); // maybe introduce timestamp to the scalar field.
    }

    transition main(long_string: field, long_int: field, string_set: field) -> AccountQuery {
        // Generate 256-bit hashes for each field
        let node_id: field = generate_hash(long_string);
        let game_id: field = generate_hash(string_set);
        let pool_id: field = generate_hash(long_int + string_set);
        let account_id: field = generate_hash(long_string + string_set);
        let asset_id: field = generate_hash(long_string + long_int);

        // Create an instance of the AccountQuery struct
        let account_query: AccountQuery = AccountQuery {
            node_id: node_id,
            game_id: game_id,
            pool_id: pool_id,
            account_id: account_id,
            asset_id: asset_id,
        };

        return account_query then finalize(account_query);
    }

    finalize main(account_query: AccountQuery) {
        // Introduce randomness using ChaCha in the finalize block
        let random_node_id: field = account_query.node_id + ChaCha::rand_field();
        let random_game_id: field = account_query.game_id + ChaCha::rand_field();
        let random_pool_id: field = account_query.pool_id + ChaCha::rand_field();
        let random_account_id: field = account_query.account_id + ChaCha::rand_field();
        let random_asset_id: field = account_query.asset_id + ChaCha::rand_field();
        
        

        // Assert that the randomized values are different from the original ones
        assert_neq(random_node_id, account_query.node_id);
        assert_neq(random_game_id, account_query.game_id);
        assert_neq(random_pool_id, account_query.pool_id);
        assert_neq(random_account_id, account_query.account_id);
        assert_neq(random_asset_id, account_query.asset_id);
    }
}


