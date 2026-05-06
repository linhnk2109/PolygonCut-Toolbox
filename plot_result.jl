#=
    Copyright © 2026, Nam-Dũng Hoang, Nguyen Kieu Linh, and Hoang Xuan Phu
    This code was implemented for the paper titled "Polygonal Cut Algorithms
    for Finding the Convex Hull of Finite Sets with Linear Complexity"
=#

using Plots
using DelimitedFiles

# Function to safely read X and Y coordinates (bypasses headers and selects correct columns)
function read_xy_safe(filepath)
    # Read raw data (can contain both strings and numbers)
    data = readdlm(filepath, ',')
    
    # Remove the first row if it is recognized as a string (e.g., header like "index, X, Y")
    if typeof(data[1, 1]) <: AbstractString || typeof(data[1, end]) <: AbstractString
        data = data[2:end, :]
    end
    
    # If the file has 3 columns (e.g., index, X, Y), extract the last 2 columns
    # If the file has 2 columns (X, Y), extract both
    cols = size(data, 2)
    x = Float64.(data[:, cols-1])
    y = Float64.(data[:, cols])
    
    return x, y
end

function auto_plot()
    # 1. Automatically locate the result directory
    possible_dirs = [
        "CompiledExperimentApp/bin/result/Type1/",
        "result/Type1/", 
        "../result/Type1/"
    ]
    
    result_dir = ""
    for d in possible_dirs
        if isdir(d)
            result_dir = d
            break
        end
    end

    if result_dir == ""
        println("Error: Directory 'result/Type1/' not found!")
        return
    end

    # 2. Find Input and Output files
    files = readdir(result_dir)
    input_files = filter(f -> occursin("_INPUT.csv", f), files)
    
    if isempty(input_files)
        println("Error: No INPUT file found in the directory.")
        return
    end
    
    # Get the first input file and extract its base name
    input_file = input_files[1]
    base_name = replace(input_file, "_INPUT.csv" => "")
    
    # Find the corresponding output file
    output_files = filter(f -> occursin(base_name, f) && !occursin("_INPUT", f) && occursin(".csv", f), files)
    
    if isempty(output_files)
        println("Error: Input file found, but no corresponding Output file for: ", base_name)
        return
    end
    
    output_file = output_files[1]
    
    println("✅ Successfully matched data pair:")
    println(" - Input File:  ", input_file)
    println(" - Output File: ", output_file)
    
    # 3. Safely read and filter data
    println("⏳ Processing data and generating plot...")
    in_x, in_y = read_xy_safe(joinpath(result_dir, input_file))
    out_x, out_y = read_xy_safe(joinpath(result_dir, output_file))
    
    # Close the polygon (Connect the last point back to the first point)
    push!(out_x, out_x[1])
    push!(out_y, out_y[1])
    
    # 4. Plot the graph
    # Scatter plot for input points
    p = scatter(in_x, in_y, 
                label="Input Points", 
                color=:blue, 
                markersize=2, 
                markerstrokewidth=0,
                aspect_ratio=:equal, 
                size=(800, 800),
                title="Convex Hull Visualization",
                legend=:topright)
                
    # Draw the boundary of the convex hull
    plot!(p, out_x, out_y, label="Convex Hull Boundary", color=:red, linewidth=2)
    
    # Emphasize the vertices of the convex hull
    scatter!(p, out_x, out_y, label="Vertices", color=:red, markersize=5)
    
    # 5. Save the image
    img_path = joinpath(result_dir, "$(base_name)_Visualization.png")
    savefig(p, img_path)
    
    println("Visualization saved at: ", img_path)
end

# Execute the plotting function
auto_plot()