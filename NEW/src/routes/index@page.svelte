<script>
	$: search = false;
	function turnOn() {
		search = !search;
	}
</script>

<svelte:head>
	<title>SILICON FM</title>
</svelte:head>

<main>
	<div class="item flex">
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
		<h1 on:click={turnOn}>SEARCH</h1>
	</div>
	{#key search}
		{#if search}
			<div class="search">
				<input
					type="text"
					placeholder="....................................."
					style="text-transform:uppercase"
				/>
			</div>
		{/if}
	{/key}
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
		height: 340px;
	}

	input {
		background: none;
		margin: 6px 0;
		padding: 6px 0;
		text-align: center;
		width: 100vw;
		height: 340px;
		background: var(--black);
		color: var(--white);
	}

	input[type='text'] {
		font-family: nb-television-3d, sans-serif;
		font-style: normal;
		font-weight: 300;
		font-size: 120px;
		line-height: 340px;
	}

	input:focus {
		outline: none;
	}

	input::placeholder {
		color: var(--white);
	}
</style>
