include .env
export

kube-apply:
	gcloud container clusters get-credentials $(cluster-name) --project $(project-name) --region $(region)
	kubectl apply --recursive -f ./k8s

kube-delete:
	kubectl delete deployment -l app=strapi
	kubectl delete service -l app=strapi
	kubectl delete ingress -l app=strapi