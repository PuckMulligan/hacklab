# Use a base image with an FTP server (e.g., pure-ftpd)
FROM stilliard/pure-ftpd

# Copy your FTP configuration files (if any)
COPY ftp_config /etc/pure-ftpd/

# Expose FTP ports
EXPOSE 21 30000-30009

# Start the FTP server
CMD ["/usr/sbin/pure-ftpd", "-c", "50", "-C", "10", "-l", "puredb:/etc/stilliard/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R"]