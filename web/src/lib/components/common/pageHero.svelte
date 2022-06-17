<script>
	export let name;
	export let description;
	export let index;
</script>

<section>
	<div class="item">
		<!--div class="description">
			<h6>{index}</h6>
			<p>{description}</p>
		</div-->
	</div>
	<div class="item flex">
		<h1>{name}</h1>
	</div>
	<div class="item flex" />
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

	.description {
		max-width: 364px;
		margin-right: 40px;
	}

	.description p {
		font-weight: 300;
		font-size: 16px;
		line-height: 150%;
	}

	.description h6 {
		font-family: 'Roboto Mono';
		font-weight: 300;
		font-size: 22px;
		padding-bottom: 16px;
		color: var(--pink);
	}
</style>
