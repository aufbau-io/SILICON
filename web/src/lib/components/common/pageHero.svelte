<script>
	export let name;
	export let description;
	export let index;
</script>

<section>
	<div class="item flex">
		<h1>{name}</h1>
	</div>
</section>

<style>
	section {
		display: flex;
		justify-content: space-between;
		min-height: calc(100vh - 144px);
		padding: 40px 0;
		background: #171717aa;
	}

	.item {
		width: 100%;
	}

	.item.flex {
		display: flex;
		justify-content: center;
	}
</style>
