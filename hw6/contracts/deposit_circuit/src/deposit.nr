use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;

global EMPTY_LEAF: Field = 0x2df8b940e5890e4e1377e05373fae69a1d754f6935e6a780b666947431f2cdcd;

fn main(
    //TODO: fill in inputs
    id: Field,
    r: Field,
    oldPath: [Field; 8],
    oldRoot: pub Field,
    newRoot: pub Field,
    commitment: pub Field,
    index: pub Field,
) {
    //TODO: implement the logic for the deposit circuit
    let computed_commitment = pedersen_hash([id, r]);
    assert(computed_commitment == commitment);

    let computed_old_root = compute_merkle_root(EMPTY_LEAF, index, oldPath);
    assert(computed_old_root == oldRoot);

    let computed_new_root = compute_merkle_root(commitment, index, oldPath);
    assert(computed_new_root == newRoot);
}
