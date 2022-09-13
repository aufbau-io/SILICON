<script>
	export let name;
	export let description;
	export let index;
</script>

<section>
	<div class="item flex">
		<h1>{name}</h1>
		<a href="/">
			<h1 class="clickable">X</h1>
		</a>
	</div>
	``
</section>

<style>
	section {
		display: flex;
		justify-content: space-between;
		min-height: calc(100vh - 150px);
		padding: 20px 0;
		background: #121212aa;
	}

	h1 {
		font-family: nb-television-2d, sans-serif;
	}

	h1.clickable {
		cursor: pointer;
	}

	h1.clickable:hover {
		font-family: nb-television-3d, sans-serif;
	}

	.item {
		width: 100%;
	}

	.item.flex {
		display: flex;
		justify-content: space-between;
		flex-flow: row wrap;
		padding: 0 40px;
	}
</style>
