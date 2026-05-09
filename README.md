# PolygonCut Toolbox

> Copyright © 2026, Nam-Dũng Hoang, Nguyen Kieu Linh, and Hoang Xuan Phu

This toolbox was implemented for the paper:

> **Polygonal Cut Algorithms for Finding the Convex Hull  

> of Finite Sets with Linear Complexity**

---

# Download & Installation

This toolbox is provided as pre-compiled standalone binaries for both macOS and Windows. You **do not** need to install Julia or compile the source code yourself to run the experiments.

## Installation Steps

1. Go to the **Releases** page of this GitHub repository.
2. Download the appropriate version for your operating system:
   - **macOS:** `PolygonCutApp-macOS.zip`
   - **Windows:** `PolygonCutApp-Windows.zip`
3. Extract the downloaded archive.
4. Open your terminal (or Command Prompt) and navigate to the extracted `bin` directory:

```bash
cd PolygonCutApp/bin
```

---

# Running the Experiments

## Available Command-Line Arguments

| Argument | Description |
|---|---|
| `--exportResult` | Export generated points and convex hull results to `.csv` files |
| `--setNumbers` | Number of experimental datasets |
| `--dataSizes` | Number of generated points |
| `--algorithms` | Comma-separated list of algorithms to execute (`A1, A2, A3, A4, A5`) |

---

## Example Command

The following command:
- generates one dataset,
- creates 1000 points,
- executes algorithms A1–A5,
- and exports all results to CSV files.

### macOS / Linux

```bash
./PolygonCutProject --exportResult --setNumbers 1 --dataSizes 1000 --algorithms A1,A2,A3,A4,A5
```

### Windows

```cmd
.\PolygonCutProject.exe --exportResult --setNumbers 1 --dataSizes 1000 --algorithms A1,A2,A3,A4,A5
```

---

# Output Files

Generated files are automatically saved in:

```text
result/
```

Typical output files include:

```text
_INPUT.csv
_A1.csv
_A1_Alg2.csv
...
```

## File Descriptions

- `_INPUT.csv`  
  Contains generated input points (`X`, `Y` coordinates).

- `_A*.csv`  
  Contains the original convex hull results from the algorithms.

- `_A*_Alg2.csv`  
  Contains convex hull results processed using the polygonal cut algorithm.

---

# Visualizing the Results

A visualization script named `plot_result.jl` is provided to:
- automatically load generated CSV files,
- plot 2D points,
- draw convex hull boundaries,
- and save visualizations as `.png` images.

> **Note:**  
> Running the binary application does **not** require Julia.  
> However, executing the visualization script requires:
> - Julia v1.7+
> - the `Plots` package
>
> Install using:
>
> ```bash
> julia -e 'using Pkg; Pkg.add("Plots")'
> ```

---

## Step 1: Ensure Script Location

Make sure the script is located inside:

```text
PolygonCutApp/bin/
```

---

## Step 2: Run the Visualization Script

Execute:

```bash
julia plot_result.jl
```

---

# Visualization Output

The script automatically:
- finds the latest dataset in the result directory,
- loads input points and algorithm outputs,
- generates scatter plots with convex hull polygons,
- and saves high-resolution `.png` figures for each tested algorithm.

---

# Troubleshooting (macOS Only)

If you encounter a `libcholmod.dylib not found` error on macOS when running:

```bash
./PolygonCutProject
```

execute the following commands inside:

```text
PolygonCutApp/bin/
```

```bash
cp -n /Applications/Julia-1.7.app/Contents/Resources/julia/lib/julia/*.dylib ../lib/julia/ 2>/dev/null

cp -n /Applications/Julia-1.7.app/Contents/Resources/julia/lib/*.dylib ../lib/ 2>/dev/null
```

> If your installed Julia version is not `1.7`, adjust the path accordingly.

---
