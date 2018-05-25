csi_trace = read_bf_file('data/test/walk_1.dat')
csi_entry = csi_trace{1}
csi = get_scaled_csi(csi_entry)

shi = db(abs(squeeze(csi).'))
 plot(shi)
 legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast' )
 xlabel('Subcarrier index')
 ylabel('SNR [dB]')
 
 SNR = db(get_eff_SNRs(csi), 'pow')
 