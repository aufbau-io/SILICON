<script>
	import Smoker from '$lib/components/ascii/smoker.svelte';

	$: search = true;
	function turnOn() {
		search = true;
	}
</script>

<Smoker />

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
				<input type="text" placeholder="SEARCH..." style="text-transform:uppercase" />
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
		overflow: hidden;
	}

	h1 {
		font-family: nb-television-2d, sans-serif;
	}

	/*
	h1:hover {
		font-family: nb-television-3d, sans-serif;
		color: var(--accent);
	}
	*/

	.item {
		width: 100%;
	}

	.item.flex {
		display: flex;
		color: var(--white-10);
		width: 150vw;
		gap: 0 20px;
		flex-flow: row wrap;
		padding: 0 40px;
		user-select: none;
	}

	.search {
		position: absolute;
		left: 0;
		top: 65px;
		padding: 0 40px;
		display: flex;
		align-items: baseline;
		justify-content: left;
		height: 70px;
		width: calc(100vw);
	}

	input {
		text-align: left;
		background: none;
		color: var(--accent);
		background: var(--black);
		height: 120px;
		width: calc(100vw);
	}

	input[type='text'] {
		font-family: nb-television-2d, sans-serif;
		font-size: 120px;
		line-height: 0px;
	}

	input:focus {
		outline: none;
	}

	input::placeholder {
		font-family: nb-television-2d, sans-serif;
		color: var(--ACCENT);
	}

	input::selection {
		background: blue; /* WebKit/Blink Browsers */
	}
	::-moz-selection {
		background: blue; /* Gecko Browsers */
	}
</style>
