require "openssl"

module CrystalChain
  module ProofOfWork

    private def proof_of_work(difficulty = "00")
      nonce = 0
      loop do
        hash = calc_hash_with_nonce(nonce)
        if hash[0..1] == difficulty
          return nonce
        else
          nonce += 1
        end
      end
    end

    private def calc_hash_with_nonce(nonce = 0)
      sha = OpenSSL::Digest.new("SHA256")
      sha.update("#{nonce}#{@index}#{@timestamp}#{@data}#{@previous_hash}")
      sha.final.hexstring
    end
  end
end