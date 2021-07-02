log_file = open("um-server-01.txt") # opening the data file to access the data from python file


def sales_reports(log_file): # this is a function named 'sales_reports'
    for line in log_file: # loops through each row of the data
        line = line.rstrip() # on each line, all whitespace is removed
        day = line[0:3] # this will grab the first 3 characters of each line (bc [0:3] takes index 0 to 2 - non inclusive of index 3 - of the string)
        if day == "Mon": # if those chacters match these three letters-string the line will be printed to console
            print(line)


sales_reports(log_file) # calls the sales_reports function with the data assigned to the log_file variable assigned on line 1.
