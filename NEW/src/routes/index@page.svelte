<script context="module">
</script>

<svelte:head>
	<title>SILICON FM</title>
</svelte:head>

<main>
	<div class="item flex">
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
		<h1>SEARCH</h1>
	</div>
	<div class="search"><input type="text" placeholder="FUCK DJs JUST DIG" /></div>
</main>

<style>
	main {
		justify-content: space-between;
		max-height: calc(100vh - 100px);
		max-width: calc(100vw - 40px);
		padding: 16px 0;
		background: #121212aa;
		overflow: hidden;
	}

	h1 {
		font-family: nb-television-2d, sans-serif;
		cursor: pointer;
	}

	h1:hover {
		font-family: nb-television-3d, sans-serif;
		color: var(--accent);
	}

	.item {
		width: 100%;
	}

	.item.flex {
		display: flex;
		width: 150vw;
		gap: 0 20px;
		flex-flow: row wrap;
		padding: 0 40px;
		user-select: none;
	}

	.search {
		position: absolute;
		left: 50%;
		top: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		transform: translate(-50%, -50%);
		background: var(--black);
		width: 100vw;
		height: 200px;
	}

	input {
		background: none;
		margin: 6px 0;
		padding: 6px 0;
		text-align: center;
		width: 100vw;
		background: var(--accent);
		color: var(--black);
	}

	input[type='text'] {
		font-family: nb-television-3d, sans-serif;
		font-style: normal;
		font-weight: 300;
		font-size: 120px;
		line-height: 150%;
	}

	input:focus {
		outline: none;
	}

	input::placeholder {
		color: var(--black);
	}
</style>
