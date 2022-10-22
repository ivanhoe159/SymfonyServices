<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\Usermoney;
use App\Entity\Transactions;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Repository\ServiceRepository;
use App\Repository\UsermoneyRepository;
use App\Repository\TransactionsRepository;
use Doctrine\Persistence\ManagerRegistry;

class MainController extends AbstractController {
    public function balance(ManagerRegistry $doctrine)
    {
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
        ]);
    }
    public function service(ManagerRegistry $doctrine)
    {
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
        ]);
    }

    public function removeIt(ManagerRegistry $doctrine, Request $request, $id)
    {
        $entity = $doctrine->getManager();
        $service = $doctrine->getRepository(service::class)->find($id);
        $service->setActive(0);
        $entity->flush();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
        ]);
    }

    public function addIt(ManagerRegistry $doctrine, Request $request)
    {
        $id = $request->request->get('selects');
        $entity = $doctrine->getManager();
        $service = $doctrine->getRepository(service::class)->find($id);
        $service->setActive(1);
        $entity->flush();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
        ]);
    }

    public function flowIt(ManagerRegistry $doctrine)
    {
        $entity = $doctrine->getManager();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findBy(['active' => 1],);
        foreach($services as $service)
        {
            $balancer = $doctrine->getRepository(usermoney::class)->find(1);
            $balance = $balancer->getBalance();
            $entity = $doctrine->getManager();
            $transaction = new Transactions();
            $transaction->setService($service->getName());
            $transaction->setTransdate(date_create_from_format('Y-m-d', date("Y-m-d")));
            $transaction->setCost($service->getCost());
            $transaction->setBalance($balance - $service->getCost());
            $balancer->setBalance($balance - $service->getCost());
            $entity->flush();
            $entity->persist($transaction);
            $entity->flush();
        }
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
        ]);
    }

    public function addMoney(ManagerRegistry $doctrine, Request $request)
    {
        $id = 1;
        $entity = $doctrine->getManager();
        $balance = $doctrine->getRepository(usermoney::class)->find($id);
        $balance->setBalance($balance->getBalance() + $request->request->get('summ'));
        $entity->flush();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        $repository = $doctrine->getRepository(transactions::class);
        $transactions = $repository->findAll();
        return $this->render('balance.html.twig', [
            'budget' => $budget,
            'transactions' => $transactions,
        ]);
    }
}
