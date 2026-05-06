# PolygonCut-Toolbox
A standalone benchmarking toolbox for 2D Polygon Cut and Convex Hull algorithms.


# PolygonCutProject - User Guide (Binary Version)

## Overview

**PolygonCutProject** is a high-performance Julia framework designed for benchmarking and visualizing various 2D Convex Hull and Polygonal Cut algorithms on large-scale datasets.

This guide explains how to run the **compiled binary version** of the project and visualize the generated results.

---

# 🛠 Prerequisites

To run the binary executable:

- Julia is **NOT required**.

To use the visualization script (`plot_result.jl`):

- Julia v1.7 or higher is recommended.
- The `Plots.jl` package must be installed.

Install `Plots.jl` using:

```bash
julia -e 'using Pkg; Pkg.add("Plots")'
```

---

# 📦 Directory Structure

After compilation, the project structure should look similar to:

```text
CompiledExperimentApp/
│
├── bin/
│   ├── PolygonCutProject
│   ├── plot_result.jl
│
├── lib/
├── share/
├── etc/
```

---

# 🚀 Running the Experiments

## Step 1: Navigate to the Binary Folder

Open your terminal and move to the `bin` directory:

```bash
cd CompiledExperimentApp/bin
```

---

## Step 2: Execute the Binary

Basic syntax:

```bash
./PolygonCutProject [OPTIONS]
```

---

# 📌 Available Command-Line Arguments

| Argument | Description |
|----------|-------------|
| `--exportResult` | Export generated points and convex hull results to `.csv` files |
| `--setNumbers` | Number of experimental sets |
| `--dataSizes` | Number of generated points |
| `--algorithms` | Comma-separated list of algorithms to execute |

---

# ✅ Example Command

The following command:

- generates one dataset,
- creates 1000 points,
- executes algorithms A1–A5,
- exports all results to CSV files.

```bash
./PolygonCutProject --exportResult --setNumbers 1 --dataSizes "1000" --algorithms "A1,A2,A3,A4,A5"
```

---

# 📁 Output Files

The generated files are automatically saved in:

```text
result/Type1/
```

Typical output files include:

```text
_INPUT.csv
A1.csv
A2.csv
A3.csv
A4.csv
A5.csv
```

Where:

- `_INPUT.csv` contains generated input points
- `A*.csv` contains convex hull vertices or polygon cut results from each algorithm

---

# 📊 Visualizing the Results

A visualization script named `plot_result.jl` is provided to automatically:

- load the generated CSV files,
- detect the latest experiment,
- plot the 2D points,
- draw the convex hull boundary,
- save the visualization as a `.png` image.

---

## Step 1: Ensure Script Location

Make sure:

```text
plot_result.jl
```

is located inside:

```text
CompiledExperimentApp/bin/
```

---

## Step 2: Run the Visualization Script

Execute:

```bash
julia plot_result.jl
```

---

# 🖼 Visualization Output

The script automatically:

1. Finds the latest dataset
2. Loads:
   - input points
   - algorithm outputs
3. Generates:
   - scatter plot
   - convex hull polygon
4. Saves a high-resolution `.png` figure

---

# ⚠️ Troubleshooting

## macOS `libcholmod.dylib` Error

If you encounter an error similar to:

```text
libcholmod.dylib not found
```

or other `.dylib` linker issues when running:

```bash
./PolygonCutProject
```

this is caused by Julia dynamic library linking during the `create_app` process.

---

# ✅ Fix

Run the following command inside:

```text
CompiledExperimentApp/bin/
```

```bash
cp -n /Applications/Julia-1.7.app/Contents/Resources/julia/lib/julia/*.dylib ../lib/julia/ 2>/dev/null
```

After copying the libraries, rerun:

```bash
./PolygonCutProject
```

---

# ⚠️ Important Note

If your installed Julia version is not `1.7` (for example `1.8` or `1.9`), modify the path accordingly.

Example:

```bash
/Applications/Julia-1.9.app/
```

---

# 💡 Additional Notes

- The compiled binary is optimized for performance.
- Running experiments does not require installing Julia packages.
- Visualization requires:
  - Julia
  - `Plots.jl`

---

# 📌 Typical Workflow

## 1. Run Experiments

```bash
cd CompiledExperimentApp/bin

./PolygonCutProject --exportResult --setNumbers 1 --dataSizes "1000" --algorithms "A1,A2,A3,A4,A5"
```

---

## 2. Visualize Results

```bash
julia plot_result.jl
```

---

## 3. Check Generated Outputs

Results:
- CSV files → `result/Type1/`
- Figures → generated `.png` images

---
