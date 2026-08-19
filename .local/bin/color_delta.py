#!/usr/bin/env python3
import argparse

def hex_to_rgb(hexcode):
	hexcode = hexcode.lstrip('#')
	return tuple(int(hexcode[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_hex(rgb):
	return '#{:02x}{:02x}{:02x}'.format(*rgb)

def calc_delta(hex1, hex2):
	r1, g1, b1 = hex_to_rgb(hex1)
	r2, g2, b2 = hex_to_rgb(hex2)
	return (r2 - r1, g2 - g1, b2 - b1)

def apply_delta(delta, hexcode):
	r, g, b = hex_to_rgb(hexcode)
	dr, dg, db = delta
	new_rgb = (
		max(0, min(255, r + dr)),
		max(0, min(255, g + dg)),
		max(0, min(255, b + db))
	)
	return new_rgb, rgb_to_hex(new_rgb)

def main():
	parser = argparse.ArgumentParser(description='Color delta calculator and applier')
	group = parser.add_mutually_exclusive_group(required=True)

	group.add_argument('--calc-delta', nargs=2, metavar=('HEX1', 'HEX2'),
					   help='Calculate RGB delta between two hex colors')
	group.add_argument('--apply-delta', nargs=4, metavar=('DR', 'DG', 'DB', 'HEX'),
					   help='Apply RGB delta to a hex color')

	args = parser.parse_args()

	if args.calc_delta:
		hex1, hex2 = args.calc_delta
		delta = calc_delta(hex1, hex2)
		print(f'Delta: {delta}')

	elif args.apply_delta:
		dr, dg, db, hexcode = args.apply_delta
		delta = (int(dr), int(dg), int(db))
		new_rgb, new_hex = apply_delta(delta, hexcode)
		print(f'New RGB: {new_rgb}')
		print(f'New HEX: {new_hex}')

if __name__ == '__main__':
	main()
