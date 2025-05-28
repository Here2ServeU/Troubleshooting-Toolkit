#!/bin/bash
# Restart CrashLoopBackOff pods
echo "Restarting CrashLoopBackOff pods..."
kubectl get pods --all-namespaces | grep CrashLoopBackOff | awk '{print $1, $2}' | while read ns pod; do
  kubectl delete pod $pod -n $ns
done
