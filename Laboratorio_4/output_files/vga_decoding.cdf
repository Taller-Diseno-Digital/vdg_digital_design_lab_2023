/* Quartus Prime Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("D:/Documentos/TEC/2023/I Semestre/Taller de Diseno Digital/VGA MODULE/output_files/") File("vga_decoding.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;