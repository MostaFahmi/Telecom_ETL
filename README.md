## Project Overview

**Objective:** Periodically save CSV files with transaction data, handle rejected records, ensure data quality during registration, and organize stored files.

### Key Features

1. **Periodic CSV Saving:**
   - System saves CSV files every 5 minutes with customer transaction data.

2. **Rejected Records Handling:**
   - Identifies and stores rejected records in a separate table.
   - Records original file name for rejected records.

3. **Data Registration Process:**
   - Records additional data during database registration for quality assurance.
     - Number of transactions in the CSV.
     - Number stored in the database.
     - Number rejected due to conditions.
     - Links stored data with the original file.

4. **File Management:**
   - Moves completed CSV files to another folder after database storage.

### Considerations

   - Implement robust error handling.
   - Regularly monitor system performance.

**Conclusion:** 
Effective solution for periodic CSV data processing, rejection handling, and organized file management, ensuring a reliable and efficient data storage process.
