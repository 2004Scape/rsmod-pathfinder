use rsmod::rsmod::block_flag::BlockAccessFlag;
use rsmod::rsmod::rotation::{rotate, rotate_flags};

#[test]
fn test_rotate_width() {
    let width = 3;
    let height = 2;
    assert_eq!(width, rotate(0, width, height));
    assert_eq!(height, rotate(1, width, height));
    assert_eq!(width, rotate(2, width, height));
    assert_eq!(height, rotate(3, width, height));
}

#[test]
fn test_rotate_height() {
    let width = 3;
    let height = 2;
    assert_eq!(height, rotate(0, height, width));
    assert_eq!(width, rotate(1, height, width));
    assert_eq!(height, rotate(2, height, width));
    assert_eq!(width, rotate(3, height, width));
}

#[test]
fn test_rotate_block_access_flag_north() {
    let north = BlockAccessFlag::BLOCK_NORTH as u8;
    assert_eq!(
        BlockAccessFlag::BLOCK_NORTH,
        BlockAccessFlag::from(rotate_flags(0, north))
    );
}
