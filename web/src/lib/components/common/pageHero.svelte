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
		min-height: 255px;
		padding: 40px 0;
		border-bottom: solid 1px var(--white-30);
	}

	.item {
		width: 100%;
	}

	.item.flex {
		display: flex;
		justify-content: center;
	}
</style>
