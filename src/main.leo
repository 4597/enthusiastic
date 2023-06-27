// The 'enthusiastic' program.
program enthusiastic.aleo {

    
    record Token {
        owner: address,
        gates: u64,
        sign_num: u64
    }



    // An on-chain mapping, storing the amount of tokens owned by each account
    // The account is stored as a to preserve user privacy.
    mapping sign_nums: field => u64;

    transition account(owner: address, sign_address:address) -> Token {
        assert_eq(self.caller, aleo1gv8r6s5dnj9cmse33fxm9869fllvktwqc8wdd77eeyh7rty04qpqknkq4x);
        return Token {
            owner : owner,
            gates : 0u64,
            sign_num : 0u64,
        };
    }
  



    transition add_sign(token: Token ) -> Token {
      assert_eq(self.caller, aleo1gv8r6s5dnj9cmse33fxm9869fllvktwqc8wdd77eeyh7rty04qpqknkq4x);
    
        let isss : u64 = token.sign_num + 1u64;
        let remaining: Token = Token {
            owner: token.owner,
            gates: token.gates,
            sign_num : isss,
        };


        let hash: field = BHP512::hash_to_field(token.owner);
        return remaining then finalize (hash);
    }


    finalize add_sign(hash: field ) {
        let vote_number: u64 = Mapping::get_or_use(sign_nums, hash, 0u64);
        Mapping::set(sign_nums, hash, vote_number);
    }



    transition finish(bid: Token) -> Bid {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo1hv9us8t2p37tph5vczufguqgmnjg0lse68gqsmkzhl8qg6w56urqwlc8el);
        // Return 'is_winner' as 'true' in the winning 'Bid'.
        return Bid {
            owner: bid.owner,
            gates: bid.gates,
            sign_num: bid.sign_num
        };
    }
    
}
